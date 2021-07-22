# DNAnexus Build Applet Github Action

This github action builds/publishes a dnanexus applet to a specified project.

## Inputs

### `project-id`

**Required** The dnanexus project id

### `overwrite`

**Required** Specify if existing applet(s) of the same name in the destination folder will be overwritten. Defaults to 'false'.

### `applet-directory`

**Required** The directory in the repo that contains the DNAnexus applet Defaults to "."

## Outputs

### `applet-id`

The id of the dnanexus applet that was built.

## Secrets

You'll need to set an environment variable, `DX_TOKEN`, in project settings that contains a dnanexus token with adequate authorizations.

## Example usage in a github workflow

```yaml
uses: actions/dx-build-github-action@main
with:
  project-id: project-1234
  overwrite: true
  applet-directory: './dx-applet'
  env:
    DX_TOKEN: ${{ secrets.DX_TOKEN }}
```
