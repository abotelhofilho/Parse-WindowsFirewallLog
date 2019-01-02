function Parse-WindowsFirewallLog
{
    Param
    (
         [Parameter(Mandatory=$True, Position=0)]
         [string] $Path
    )
## Import file and use whitespace as the delimiter, set headers and skip the first three lines because windows puts in some junk in the first three lines for the logs files... enjoy
    Import-CSV -path $Path -Delimiter "` " -h Date , Time , Action , Protocol , Src_ip , Dst_ip , Src_port , Dst_port , Size , TCPflags , TCPsyn , TCPack , TCPwin , ICMPtype , ICMPcode , Info , Path | Select-Object -Skip 3
}
