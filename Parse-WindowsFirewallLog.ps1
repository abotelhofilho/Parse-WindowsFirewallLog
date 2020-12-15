<#
Parses Windows firewall log into a managable objects for better filtering.  Best results is to pipe it into Format-Table.

default path is to windows default firewall log location.  If your file is located somewhere else use the -path parameter.
#>

function Parse-WindowsFirewallLog {
    Param
    (
        [Parameter(Mandatory = $false)] [string] $Path = "C:\Windows\System32\LogFiles\Firewall\pfirewall.log"
    )
    ## Import file and use whitespace as the delimiter, set headers and skip the first three lines because windows puts in some junk in the first three lines for the logs files... enjoy
    If ( (Test-Path -Path $path ) -eq $true ) {
        Import-CSV -path $Path -Delimiter "` " -h Date , Time , Action , Protocol , Src_ip , Dst_ip , Src_port , Dst_port , Size , TCPflags , TCPsyn , TCPack , TCPwin , ICMPtype , ICMPcode , Info , Path | Select-Object -Skip 3
    }
    else {
        Write-Host "Error: Windows firewall logs are not located in the default location $path.  Please rerun providing the log path using the -path parameter."
    }

}
