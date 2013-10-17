function Get-RssContent {
	Param(
		[Parameter(Mandatory=$true)]
		[ValidateNotNull()]
		[string] $Keywords = $(throw "Keywords parameter is required"),
		[string] $ExcludeWords,
		[int] $CategoryId=0
	)
	$url = Build-Url -Keywords $Keywords -ExcludeWords $ExcludeWords -CategoryId $CategoryId
	try{
		$WebClient = New-Object System.Net.WebClient
		$Results = $WebClient.DownloadString("$url")
		return [xml]"${Results}" 
	} catch{
		Write-host $_
	}
}
