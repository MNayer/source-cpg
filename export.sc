import org.apache.commons.lang.StringEscapeUtils.escapeJava
import better.files.File

val methodToCPG = (method: Method) =>  escapeJava(method.head.dotCpg14.l.head)

val methodToJson = (method: Method) => { 
  s"{\"name\": \"${method.name}\", \"start\": ${method.lineNumber.get}, \"end\": ${method.lineNumberEnd.get}, \"cpg\": \"${methodToCPG(method)}\"}"
}

@main def export(inputFile: String, outFile: String) = {
   importCode(inputFile)
   cpg.method.filter(method => method.name != "<global>")
     .filter(method => !method.isExternal)
     .filter(method => method.name != None && method.lineNumber != None && method.lineNumberEnd != None)
     .map(methodToJson)
     .foreach(method => File(outFile).append(method).append("\n"))
}
