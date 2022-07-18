@main def export(cpgFile: String, outFile: String) = {
   loadCpg(cpgFile)
   cpg.method.filter(method => method.name != "<global>").filter(method => !method.isExternal).head.dotCpg14.l |> outFile
}
