import java.io.File

import scala.concurrent._
import scala.concurrent.duration._
import scala.util._
implicit val ec = ExecutionContext.global
def timeoutFuture[A](f: Future[A]): Try[A] =
  Try { Await.result(f, 30.seconds) }

def getListOfFiles(dir: String):List[File] = {
    /* From
     * https://alvinalexander.com/scala/how-to-list-files-in-directory-filter-names-scala/
     * */
    val d = new File(dir)
    if (d.exists && d.isDirectory) {
        d.listFiles.filter(_.isFile).toList
    } else {
        List[File]()
    }
}

def cpgToDotFile(cpg: io.shiftleft.codepropertygraph.generated.Cpg, outputFile: String) = {
  cpg.method.filter(method => method.name != "<global>")
    .filter(method => !method.isExternal)
    .head.dotCpg14.l |> outputFile
}

def processFile(outputDir: String)(inputFile: String) = {
  val name = new File(inputFile).getName().split("\\.").head
  val outputFile = new File(outputDir, name + ".dot").getPath
  val f = Future { importCode(inputFile) }
  timeoutFuture(f) match {
      case Failure(exception) =>
        val file = new File(outputFile)
        file.createNewFile()
        println("FAIL: IMPORTCODE")
      case Success(cpg) =>
        val f = Future { cpgToDotFile(cpg, outputFile) }
        timeoutFuture(f) match {
          case Failure(exception) =>
            println("FAIL: TIMEOUT")
            val file = new File(outputFile)
            file.createNewFile()
          case Success(res) =>
            println("SUCCESS")
        }
  }
}

@main def export(inputDir: String, outputDir: String) = {
  getListOfFiles(inputDir).map(file => file.toString()).foreach(processFile(outputDir))
}
