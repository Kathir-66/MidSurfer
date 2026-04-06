# MidSurfer Windows Local Install

This repository includes a GitHub Actions workflow that builds the MidSurfer plugin for Windows against ParaView 5.11.2.

## Build the plugin artifact

1. Push your branch to a GitHub fork or repository.
2. Open the `Build Windows Plugin` workflow in the `Actions` tab.
3. Run the workflow or wait for it to run on `push` / `pull_request`.
4. Download the artifact named `MidSurfer-windows-paraview-5.11.2`.

The workflow downloads the official ParaView 5.11.2 Windows package, resolves `ParaViewConfig.cmake`, builds the plugin in `Release`, and uploads the generated MidSurfer plugin files.

## Install ParaView locally

1. Download `ParaView-5.11.2-Windows-Python3.9-msvc2017-AMD64.zip` from:
   `https://www.paraview.org/files/v5.11/ParaView-5.11.2-Windows-Python3.9-msvc2017-AMD64.zip`
2. Extract it into a user-writable folder such as `C:\Users\<you>\Tools\ParaView-5.11.2`.
3. Launch `paraview.exe` from the extracted folder.

## Load MidSurfer in ParaView

1. Extract the workflow artifact into a user-writable folder.
2. In ParaView, open `Tools -> Manage Plugins...`.
3. Click `Load New...`.
4. Select the built `MidSurfer.dll`.
5. Confirm that the `Filters` menu shows the `MidSurfer` filters.

## Smoke test

1. Open one of the sample datasets from the repository `data` folder, such as `Fig7.vti`.
2. Run `Filters -> MidSurfer -> Extract Midsurface (simple)`.
3. Open `Fig11-IMM.vti` or `Fig11-OMM.vti`.
4. Run `Filters -> MidSurfer -> Extract Midsurface (advanced)`.

If ParaView refuses to load the plugin, treat it as a binary compatibility mismatch and rebuild against a ParaView 5.11.2 tree that exports a matching `ParaViewConfig.cmake`.
