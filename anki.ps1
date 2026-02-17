$path = "languages.csv"
$csv = Import-Csv $path -Delimiter ";"
$randomRow = $csv | Sort-Object Points, {Get-Random}| Select-Object -First 1
$randomRowClone = $randomRow
$German = $randomRowClone | Select-Object "German"
$German | Format-Table -AutoSize

$blank = Read-Host

$English = $randomRowClone | Select-Object "English"
$English | Format-Table -AutoSize




$rating = Read-Host
if ($rating -eq "1")
{
  $randomRow.Points = [int]$randomRow.Points + 1
} else
{
  $randomRow.Points = [int]$randomRow.Points - 1
}

foreach ($row in $csv) {
  if ($row.German -eq $randomRow.German -and $row.English -eq $randomRow.English) {
    $row.Points = $randomRow.Points
  }
}

$csv | Export-csv $Path -Delimiter ";" -Encoding UTF8






