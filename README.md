# job-status-badge
custom action to host a status badge on a per-job basis 

[![build](https://res.cloudinary.com/djalal/custom-label-test.svg?refresh=true)](https://github.com/djalal/job-status-badge/actions/workflows/test.yaml)

[![build2](https://res.cloudinary.com/djalal/left-right-blue.svg)](https://github.com/djalal/job-status-badge/actions/workflows/test.yaml)


## Description
Github Action has status badge for workflows. According to [official documentation](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge), generated labels cannot be filtered down to specific jobs. Some jobs will succeed, and other will fail, so sometimes we want a status badge for a specific job. 

This custom action makes it easy to generate the specific label, with custom text and color, and also store it as a public asset. It is then convenient to store it in documentation pages.

## Usage

```yml
      - name: Create Custom Badge
        id: badge
        if: always()
        uses: djalal/job-status-badge@main
        with:
          cloudinary_url: ${{ secrets.CLOUDINARY_URL }}
          left_text: "hello"
          right_text: "world"
          color: "blue"
          public_id: "latest-status"
```

## External dependencies

This custom action uses Shields.io to generate the custom label. It is a free service, and does not require registration.
Also, it uses [Cloudinary](https://cloudinary.com) [large free-tier](https://cloudinary.com/pricing/compare-plans) to upload and store bagdes on a public URL. If you need support for another provider, feel free to fork this project, or open an issue.

## Input arguments

| Name                | Default                       | Description                                                |
| ------------------- | ----------------------------- | ---------------------------------------------------------- |
| `cloudinary_url`    | ${{ secrets.CLOUDINARY_URL }} | available from the [Cloudinary Console](https://cloudinary.com/console/), to be added as a [GH secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets) |
| `left_text `        | None                          | left text to write on the custom label                     |
| `right_text `       | None                          | right text to write on the custom label                    |
| `color`             | `green`                       | color name of the right side of badge                      |
| `public_id`         | None                          | The file path to the issue content.                        |


## Output

- `secure_url` - Unique URL to the new asset
- `public_id`  - Public filename of uploaded badge
- `bytes`      - Size of uploaded badge, in bytes

