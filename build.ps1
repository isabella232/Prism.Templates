param (
    [string]$TemplatePackRoot = '.',
    [string]$Version = '1.0.0'
    )

try
{
    function Get-ScriptDirectory {
        Split-Path -parent $PSCommandPath
    }

    Write-Host "Execution Path"
    $ScriptRoot = Get-ScriptDirectory
    Write-Host $ScriptRoot

    Write-Host "Begin Project Templates Nuget pack ..."

    $tempPath = Join-Path $TemplatePackRoot -ChildPath "Templates"
    New-Item -ItemType Directory -Force -Path $tempPath
    $nugetOutputDirectory = Resolve-Path -Path $tempPath
    $nugetFileName = Join-Path $ScriptRoot -ChildPath "nuget.exe"

    $wpfRootPath = Join-Path $ScriptRoot -ChildPath "Wpf"
    $formsRootPath = Join-Path $ScriptRoot -ChildPath "Xamarin.Forms"
    $unoRootPath = Join-Path $ScriptRoot -ChildPath "Uno"

    $iconPath = Join-Path $ScriptRoot -ChildPath "prism-logo.png"
    $licensePath = Join-Path $ScriptRoot -ChildPath "LICENSE.txt"

    Write-Host "NuGet Output Path set to: $nugetOutputDirectory"

    if (!(Test-Path $nugetFileName))
    {
        Write-Host "Downloading Nuget.exe ..."
        Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile $nugetFileName
        Write-Host "Downloading Nuget.exe complete"
    }

    if(!(Test-Path $iconPath))
    {
        Write-Host "Downloading Prism Logo"
        Invoke-WebRequest -Uri "https://github.com/PrismLibrary/Prism/blob/master/images/prism-logo.png?raw=1" -OutFile $iconPath
        Write-Host "Finished downloading Prism Logo"
    }

    if(!(Test-Path $licensePath))
    {
        Write-Host "Downloading Prism License File"
        Invoke-WebRequest -Uri "https://github.com/PrismLibrary/Prism/blob/master/LICENSE?raw=1" -OutFile $licensePath
        Write-Host "Finished downloading Prism License File"
    }

    $wpfNuspecPath = Join-Path $wpfRootPath -ChildPath "Prism.Wpf.Templates.nuspec"
    $xfNuspecPath = Join-Path $formsRootPath -ChildPath "Prism.Xamarin.Forms.Templates.nuspec"
    $unoNuspecPath = Join-Path $unoRootPath -ChildPath "Prism.Uno.Templates.nuspec"

    $nugetHash = git rev-parse HEAD

    Invoke-Expression "$nugetFileName pack $wpfNuspecPath -OutputDirectory $nugetOutputDirectory -Version $Version -properties commitId=$nugetHash"

    Invoke-Expression "$nugetFileName pack $xfNuspecPath -OutputDirectory $nugetOutputDirectory -Version $Version -properties commitId=$nugetHash"

    Invoke-Expression "$nugetFileName pack $unoNuspecPath -OutputDirectory $nugetOutputDirectory -Version $Version -properties commitId=$nugetHash"

    Write-Host "Completed Project Templates Nuget pack ..."
}
catch
{
    Write-Host $ErrorMessage = $_.Exception.Message
    exit 1
}