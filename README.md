# pdf2text

This is our CLI to extract text and information from PDF files. At the moment it uses the Adobe Extract API, and falls back to pdfalto if that fails.

## Docker development (recommended)

### 1. Building the docker image

`make build` or `docker build -t navigator-pdf-parser .`

### 2. Running the cli
Use the following commands to run the pdf2text cli:

**local:**

```
docker run -v /path/to/pdf/files:/pdf-in -v /path/to/data/directory:/data-dir -v /path/to/output/directory:/pdf-out navigator-pdf-parser python /app/pdf2text.py /pdf-in /data-dir /pdf-out
```

**s3:**

Note that intermediate data files aren't currently uploaded to s3.

```
docker run -v /path/to/data/directory:/data-dir python pdf2text.py output-bucket/folder/folder /data-dir input-bucket/folder/folder --s3
```

where:

- `/path/to/pdf/files` - is the path to the directory containing the pdf files to process
- `/path/to/output/directory` - is the path to the directory where the output files should be stored

### Output files
Output files produced by the process will be placed in the output directory. 1-2 files per pdf file will be generated depending on the following arguments passed to the cli:

- `--json` - generates a .json file containing extracted text blocks and positional information
- `--text` - generates a .txt file containing extracted text

The name of each .json and .txt file generated will be set to the corresponding pdf filename.

e.g. `pdf-input-file.pdf` will produce the following 2 files in the output directory once processed:

- `pdf-input-file.json`
- `pdf-input-file.txt`

## Local development

1. Install [pdfalto](https://github.com/kermitt2/pdfalto), and set the `PDFALTO_PATH` environment variable to the installation path.
2. Install poetry environment and pre-commit hooks: `make dev_install`
3. Activate poetry environment: `poetry shell`
