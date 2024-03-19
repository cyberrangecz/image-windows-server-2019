# Get information about the system drive
$partition = Get-Partition -DriveLetter 'C'

# Defrag disk
Optimize-Volume -DriveLetter 'C' -Defrag -Retrim

# Resize the system partition with the updated size
@"
sel disk $($partition.DiskNumber)
sel part $($partition.PartitionNumber)
shrink
"@ | diskpart
