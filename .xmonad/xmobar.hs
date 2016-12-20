Config {
    font = "xft:MesloLGM:size=10:bold:antialias=true",
    bgColor = "#242424",
    fgColor = "#gray",
    position = TopW L 100
    commands = [
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3> <total4> <total5>","-L","30","-H","60","-h","#F255555","-l","gray90","-n","gray90","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#F25555","-l","gray90","-n","gray90"] 10,
        Run Network "em1" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#gray90","-l","gray90","-n","gray90"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %em1%   <fc=#ffb86c>%date%</fc> ",
    overrideRedirect=False
}