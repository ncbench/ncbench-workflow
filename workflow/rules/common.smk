def get_zenodo_tag(entry):
    if "restricted-access-token-envvar" in entry:
        return f"zenodo_{entry['deposition']}"
    else:
        return "zenodo"


# add path to callsets
for key, callset in config["variant-calls"].items():
    if "zenodo" in callset:
        if "path" not in callset:
            print(callset["zenodo"])
            filename = callset["zenodo"]["filename"]
            callset["path"] = f"resources/zenodo/variant-calls/{key}/{filename}"
        tag = get_zenodo_tag(callset["zenodo"])
        if tag != "zenodo":
            workflow.storage_registry.register_storage(
                provider="zenodo",
                tag=tag,
                restricted_access_token=os.environ[
                    callset["zenodo"]["restricted-access-token-envvar"]
                ],
            )


def get_zenodo_input(wildcards):
    entry = config[wildcards.section][wildcards.entry]["zenodo"]
    print(entry)

    tag = get_zenodo_tag(entry)
    return getattr(storage, tag)(
        f"zenodo://record/{entry['deposition']}/{wildcards.path}"
    )
