import FBFState;
import std.file;
import std.stdio;
void main(string[] args) {
 string ns;
 File f = File(args[1], "r");
 while (!f.eof()) {
  string line = f.readln();
  ns = ns~line~"\n";
 }
 FBFParser state = new FBFParser(ns);
 state.execute("out.c");
}
