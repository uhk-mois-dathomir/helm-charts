# helm-charts

This repository is configured as a Helm chart repository published via GitHub Pages.

## Chart layout

Store charts in the `/charts` directory:

```
charts/
  my-chart/
    Chart.yaml
```

## Publishing

The workflow in `.github/workflows/release-charts.yml` packages all charts from `/charts`,
builds `index.yaml`, and publishes the result to the `gh-pages` branch.

The published chart repository URL is:

`https://uhk-mois-dathomir.github.io/helm-charts`

Use it with Helm:

`helm repo add uhk-mois-dathomir https://uhk-mois-dathomir.github.io/helm-charts`