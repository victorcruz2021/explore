
#Validates the Domain name Joined to proceed
$Domain = $hostname = $null
$Domain = (Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem).domain
$hostname = (Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem).hostname

if ( $Domain -eq "explore.local"  ){

    Write-Output "The Domain is correct and can continue ${hostname}
    Domain name = ${Domain}"
}else{
    Write-Output "This is not a Domain Joined server
    Domain name = ${Domain}"
}

#Firewall Rule to enable ICMP protocol
New-NetFirewallRule -DisplayName “ICMPv4” -Direction Inbound -Action Allow -Protocol icmpv4 -Enabled True
