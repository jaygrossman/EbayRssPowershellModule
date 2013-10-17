Function Build-Url{
	Param(
		[Parameter(Mandatory=$true)]
		[ValidateNotNull()]
		[string] $Keywords = $(throw "Keywords parameter is required"),
		[string] $ExcludeWords,
		[int] $CategoryId=0
	)
	$ExcludeWords.Split(' ') | % {
		$Keywords += ' -${_}'
	}
	$Keywords = $Keywords.Replace(" ", "+")
	$Keywords = $Keywords.Replace("(", "%28")
	$Keywords = $Keywords.Replace(")", "%29")
	$url = 'http://www.ebay.com/sch/rss/${CategoryId}/i.html?rt=nc&_nkw=${Keywords}&_rss=1&'
	$url = $ExecutionContext.InvokeCommand.ExpandString($url)
	return $url
}
