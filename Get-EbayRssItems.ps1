Function Get-EbayRssItems {
	Param(
		[Parameter(Mandatory=$true)]
		[ValidateNotNull()]
		[string] $Keywords = $(throw "Keywords parameter is required"),
		[string] $ExcludeWords,
		[int] $CategoryId
	)
	$items = @()
		
	$xml = Get-RssContent -Keywords $Keywords -ExcludeWords $ExcludeWords -CategoryId $CategoryId
	$xml.rss | % {$_.channel.item} | % {
		$item = $_
		$items += Parse-ListingInfo $item
	}
	return $items
}