# add path to callsets
for key, callset in config["variant-calls"].items():
    if "path" not in callset and "zenodo" in callset:
        filename = callset["zenodo"]["filename"]
        callset["path"] = f"resources/zenodo/variant-calls/{key}/{filename}"


def get_zenodo_input(wildcards):
    entry = config[wildcards.section][wildcards.entry]["zenodo"]

    provider = "zenodo"
    if "restricted-access-token-envvar" in entry:
        tag = f"zenodo_{entry['deposition']}"
        storage.register_storage(
            provider="zenodo",
            tag=tag,
            restricted_access_token=os.environ[
                entry["restricted-access-token-envvar"]
            ],
        )
        provider = tag
    return getattr(storage, provider)(
        f"zenodo://record/{entry['deposition']}/{entry['filename']}"
    )
