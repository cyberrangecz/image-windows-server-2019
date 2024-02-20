# Get information about the system drive
$systemDrive = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Name -eq 'C' }

# Get the used space on the system drive
$usedSpaceGB = [math]::Round($systemDrive.Used / 1GB, 2)

# Add 2 GB to the used space
$updatedSizeGB = $usedSpaceGB + 2

# Convert Variable
$updatedSizeBytes = $updatedSizeGB * 1GB

# Resize the system partition with the updated size
Resize-Partition -DriveLetter 'C' -Size $updatedSizeBytes
