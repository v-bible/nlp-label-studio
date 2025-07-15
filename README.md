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
  - `LABEL_STUDIO_LEGACY_TOKEN`: Legacy token for Label Studio API. You can
    generate it in the Label Studio settings page.

E.g:

```
# .env
LABEL_STUDIO_URL=http://label-studio:8080
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

<!-- Usage -->

## :eyes: Usage

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

For NER tasks, you can use the
[template](https://labelstud.io/templates/named_entity) provided by Label
Studio. You can customize the interface by using the `ner-config.xml`.

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

### Machine Learning Backend

To connect to the Machine Learning backend, you can use your local IP address:

```bash
http://<your-local-ip>:9090
```

or `huggingface_ner` service name in the Docker Compose network:

```bash
http://huggingface_ner:9090
```

### Data Mounting

Studio data is mounted to `studio-data` directory.
Machine Learning backend data is mounted to `ml-backend-data` directory.

> [!NOTE]
> As this is a non-root container, the mounted files and directories must have
> the proper permissions for the `UID 1001`.

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
