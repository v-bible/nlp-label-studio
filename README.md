<div align="center">

  <h1>nlp-label-studio</h1>

  <p>
    Setup for Label Studio
  </p>

<!-- Badges -->
<p>
  <a href="https://github.com/v-bible/nlp-label-studio/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/v-bible/nlp-label-studio" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/v-bible/nlp-label-studio" alt="last update" />
  </a>
  <a href="https://github.com/v-bible/nlp-label-studio/network/members">
    <img src="https://img.shields.io/github/forks/v-bible/nlp-label-studio" alt="forks" />
  </a>
  <a href="https://github.com/v-bible/nlp-label-studio/stargazers">
    <img src="https://img.shields.io/github/stars/v-bible/nlp-label-studio" alt="stars" />
  </a>
  <a href="https://github.com/v-bible/nlp-label-studio/issues/">
    <img src="https://img.shields.io/github/issues/v-bible/nlp-label-studio" alt="open issues" />
  </a>
  <a href="https://github.com/v-bible/nlp-label-studio/blob/main/LICENSE.md">
    <img src="https://img.shields.io/github/license/v-bible/nlp-label-studio.svg" alt="license" />
  </a>
</p>

<h4>
    <a href="https://github.com/v-bible/nlp-label-studio/">View Demo</a>
  <span> · </span>
    <a href="https://github.com/v-bible/nlp-label-studio">Documentation</a>
  <span> · </span>
    <a href="https://github.com/v-bible/nlp-label-studio/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/v-bible/nlp-label-studio/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->

# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  - [Environment Variables](#key-environment-variables)
- [Getting Started](#toolbox-getting-started)
  - [Prerequisites](#bangbang-prerequisites)
  - [Run Locally](#running-run-locally)
- [Usage](#eyes-usage)
  - [Base Label Studio Configuration](#base-label-studio-configuration)
  - [Entity Label Categories](#entity-label-categories)
  - [Login Credentials](#login-credentials)
  - [Custom Labeling Interface](#custom-labeling-interface)
  - [Machine Learning Backend](#machine-learning-backend)
  - [Data Mounting](#data-mounting)
- [Contributing](#wave-contributing)
  - [Code of Conduct](#scroll-code-of-conduct)
- [License](#warning-license)
- [Contact](#handshake-contact)

<!-- About the Project -->

## :star2: About the Project

<!-- Env Variables -->

### :key: Environment Variables

To run this project, you will need to add the following environment variables to
your `.env` file:

- **Label Studio configs:**

  - `LABEL_STUDIO_URL`: URL of the Label Studio instance. E.g.:
    `http://label-studio:8080`.
  - `LABEL_STUDIO_USERNAME`: Default username for Label Studio. Default:
    `example@gmail.com`.
  - `LABEL_STUDIO_PASSWORD`: Default password for Label Studio. Default:
    `admin`.

- **Label Studio ML backend:**

  - `LABEL_STUDIO_LEGACY_TOKEN`: Legacy token for Label Studio API. You can
    generate it in the Label Studio settings page.

E.g:

```
# .env
LABEL_STUDIO_URL=http://label-studio:8080
LABEL_STUDIO_USERNAME=example@gmail.com
LABEL_STUDIO_PASSWORD=admin

LABEL_STUDIO_LEGACY_TOKEN=eyJhb***
```

You can also check out the file `.env.example` to see all required environment
variables.

<!-- Getting Started -->

## :toolbox: Getting Started

<!-- Prerequisites -->

### :bangbang: Prerequisites

- Docker and Docker Compose installed on your machine.

<!-- Run Locally -->

### :running: Run Locally

Clone the project:

```bash
git clone https://github.com/v-bible/nlp-label-studio.git
```

Go to the project directory:

```bash
cd nlp-label-studio
```

Start the services:

```bash
docker-compose up -d
```

Access Label Studio in your browser:

> [!NOTE]
> You may have to wait a few minutes for the services to start.

```
http://localhost:8080
```

> [!NOTE]
> If you can't start label-studio service due to permission issues, you can run
> the following command to change the permissions of the mounted directories:

```bash
make change-permissions
```

<!-- Usage -->

## :eyes: Usage

### Base Label Studio Configuration

Base label studio configuration that works with ML backend is stored at
`label_studio_base.sqlite3`. You can copy and replace file
`./studio-data/label_studio.sqlite3` to restore basic setup.

Base configuration includes:

- Connect to Machine Learning backend (defined in `docker-compose.yaml`).
- Custom Labeling interface.
- Project `v-bible` created.
- Legacy token enabled.

### Entity Label Categories

> [!NOTE]
> Please refer to [v-bible/nlp](https://github.com/v-bible/nlp) for more information

| label |   category   |              examples              |          vietnamese examples           |
| :---: | :----------: | :--------------------------------: | :------------------------------------: |
|  PER  |    person    | Jesus, Mary, Peter, Paul, John,... | Giêsu, Maria, Phêrô, Phaolô, Gioan,... |
|  LOC  |   location   |   Jerusalem, Rome, Bethlehem,...   |      Giêrusalem, Rôma, Bêlem,...       |
|  ORG  | organization |    Vatican, Catholic Church,...    |    Vatican, Giáo Hội Công Giáo,...     |
| TITLE |    title     |     Pope, Bishop, Cardinal,...     |    Giáo hoàng, Giám mục, Hồng y,...    |
|  TME  |     time     |    Sunday, Monday, January,...     |  Chúa Nhật, Thứ Hai, Tháng Giêng,...   |
|  NUM  |    number    |         1, 2, 3, 4, 5,...          |           1, 2, 3, 4, 5,...            |

### Login Credentials

In `docker-compose.yaml`, by default the credentials are set to:

```
LABEL_STUDIO_USERNAME=example@gmail.com
LABEL_STUDIO_PASSWORD=admin
```

### Getting API Token

To get Label Studio Legacy API token, go to
`http://localhost:8080/organization` > `API Tokens Settings` > Check `Legacy
Tokens` > `Save`.

### Custom Labeling Interface

#### NER Configuration

For NER tasks, you can use the
[template](https://labelstud.io/templates/named_entity) provided by Label
Studio. You can customize the interface by using the [`configs/ner-config.xml`](./configs/ner-config.xml).

```xml
<!-- ner-config.xml -->
<View style="display:flex; gap:16px;">
  <!-- Main Text Area -->
  <View style="flex:1;">
    <Text name="text" value="$text"/>
  </View>

  <!-- Metadata + Label Panel -->
  <View style="position:sticky; top:10px; align-self:flex-start; max-width:250px; width:100%; padding:8px; border:1px solid #ccc; border-radius:4px;">
     <!-- Label Panel -->
    <Labels name="label" toName="text" showInline="false">
      <Label value="PER" background="#e6194b"/>
      <Label value="LOC" background="#3cb44b"/>
      <Label value="ORG" background="#4363d8"/>
      <Label value="TITLE" background="#f58231"/>
      <Label value="TME" background="#911eb4"/>
      <Label value="NUM" background="#ffe119"/>
    </Labels>

    <!-- Metadata Section -->
    <View style="font-size:12px; margin-top:12px;">
      <Header value="Metadata" size="4"/>
      <Header value="Document ID: $documentId" size="5"/>
      <Header value="Sentence ID: $sentenceId" size="5"/>
      <Header value="Sentence Type: $sentenceType" size="5"/>
      <Header value="Language Code: $languageCode" size="5"/>
      <Header value="Title: $title" size="5"/>
      <Header value="Genre: $genreCode" size="5"/>
    </View>
  </View>
</View>
```

#### OCR Configuration

For OCR tasks, you can use the
[template](https://labelstud.io/templates/ocr) provided by Label Studio. You can
customize the interface by using the
[`configs/ocr-config.xml`](./configs/ocr-config.xml).

> [!NOTE]
> I have disabled `required` field for `transcription` to allow skipping text
> transcription when there is no text in the selected region. You can change it
> back if needed. I also disabled `zoomControl` for better user experience.

```xml
<View>
	<Image name="image" value="$ocr" zoom="false" rotateControl="true" zoomControl="false"/>
	<Labels name="label" toName="image">
		<Label value="Text" background="green"/>
		<Label value="Handwriting" background="blue"/>
	</Labels>
	<Rectangle name="bbox" toName="image" strokeWidth="3"/>
	<Polygon name="poly" toName="image" strokeWidth="3"/>
	<TextArea name="transcription" toName="image" editable="true" perRegion="true" required="false" maxSubmissions="1" rows="5" placeholder="Recognized Text" displayMode="region-list"/>
</View>
```

### Machine Learning Backend

> [!IMPORTANT]
> To connect to machine learning backend, remember to set the
> `LABEL_STUDIO_LEGACY_TOKEN` and `LABEL_STUDIO_URL` (optional) environment
> variable in your `.env` file.

Run the docker compose with profile `ml-backend` to enable machine learning backend:

```bash
docker-compose --profile ml-backend up -d
```

To connect to the Machine Learning backend, you can use your local IP address:

```bash
http://<your-local-ip>:9090
```

or `huggingface_ner` service name in the Docker Compose network:

```bash
http://huggingface_ner:9090
```

By default machine learning backend use model
[`NlpHUST/ner-vietnamese-electra-base`](https://huggingface.co/NlpHUST/ner-vietnamese-electra-base)
for better Vietnamese NER results. You can change this by modifying the
`docker-compose.yaml` file.

By default machine learning backend is stored at `huggingface_ner` folder, which
is just copied from
`label-studio-ml-backend/label_studio_ml/examples/huggingface_ner`, any
changes from submodules `label-studio-ml-backend` may be updated periodically.

### Data Mounting

Studio data is mounted to `studio-data` directory.
Machine Learning backend data is mounted to `ml-backend-data` directory.

> [!NOTE]
> As this is a non-root container, the mounted files and directories must have
> the proper permissions for the `UID 1001`.

To change permissions of the mounted directories, you can use the
`Makefile` provided in the project root:

```bash
make change-permissions
```

### Makefile

You can use the provided `Makefile` to manage the project easily.

- Change permissions of mounted directories:

```bash
make change-permissions
```

- Reset base (copy `label_studio_base.sqlite3` to
  `studio-data/label_studio.sqlite3`):

```bash
make reset-base
```

<!-- Contributing -->

## :wave: Contributing

<a href="https://github.com/v-bible/nlp-label-studio/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=v-bible/nlp-label-studio" />
</a>

Contributions are always welcome!

Please read the [contribution guidelines](./CONTRIBUTING.md).

<!-- Code of Conduct -->

### :scroll: Code of Conduct

Please read the [Code of Conduct](./CODE_OF_CONDUCT.md).

<!-- License -->

## :warning: License

This project is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)** License.

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

See the **[LICENSE.md](./LICENSE.md)** file for full details.

<!-- Contact -->

## :handshake: Contact

Duong Vinh - [@duckymomo20012](https://twitter.com/duckymomo20012) -
tienvinh.duong4@gmail.com

Project Link: [https://github.com/v-bible/nlp-label-studio](https://github.com/v-bible/nlp-label-studio).
