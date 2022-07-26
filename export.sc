import java.io.File

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

def processFile(outputDir: String)(inputFile: String) = {
  val name = new File(inputFile).getName().split("\\.").head
  val outputFile = new File(outputDir, name + ".dot").getPath
  importCode(inputFile)
  cpg.method.filter(method => method.name != "<global>")
    .filter(method => !method.isExternal)
    .head.dotCpg14.l |> outputFile
}

@main def export(inputDir: String, outputDir: String) = {
  getListOfFiles(inputDir).map(file => file.toString()).foreach(processFile(outputDir))
}
