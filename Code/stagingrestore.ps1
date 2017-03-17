# connect
Login-AzureRmAccount

# get prod database context
$database = Get-AzureRmSqlDatabase -ResourceGroupName "DevOpsDBA" -ServerName "dkranchlabdemo" -DatabaseName "PartsUnlimited"

# get latest restore point
$latest = (Get-Date).AddMinutes(-6).ToUniversalTime()

$rgname = "DevOpsDBA"
$server = "dkranchlabdemo"
$newname = "PartsUnlimited_Staging"
$restoretime = (Get-Date $localtime).ToUniversalTime()
$newedition = "Basic"
$newservice = "Basic"

$restoretime = $latest

# remove old database
Remove-AzureRmSqlDatabase -ServerName $server -ResourceGroupName $rgname -DatabaseName $newname

# restore latest copy
$restoredDb = Restore-AzureRmSqlDatabase -FromPointInTimeBackup -PointInTime $restoretime -ResourceGroupName $rgname -ServerName $server -TargetDatabaseName $newname -Edition $newedition -ServiceObjectiveName $newservice `  -ResourceId $database.ResourceID

