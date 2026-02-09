def get_zenodo_tag(entry):
    if "restricted-access-token-envvar" in entry:
        return f"zenodo_{entry['deposition']}"
    else:
        return "zenodo"


# Filter callsets by subcategory if specified via --config subcategory=...
# This allows running benchmarks in parallel across multiple CI runners
if "subcategory" in config:
    config["variant-calls"] = {
        key: callset
        for key, callset in config["variant-calls"].items()
        if callset.get("subcategory") == config["subcategory"]
    }


# Filter callsets by benchmark if specified via --config benchmark=...
# This allows splitting CI work further (e.g. giab-NA12878-agilent-75M vs 200M).
if "benchmark" in config:
    config["variant-calls"] = {
        key: callset
        for key, callset in config["variant-calls"].items()
        if callset.get("benchmark") == config["benchmark"]
    }


# Filter callsets by chunk if specified via --config chunk_index=... and chunk_size=...
# This allows splitting large benchmarks into smaller groups to avoid timeouts.
if "chunk_index" in config and "chunk_size" in config:
    # Get all variant calls for this benchmark (already filtered above)
    all_calls = sorted(config["variant-calls"].keys())
    chunk_index = int(config["chunk_index"])
    chunk_size = int(config["chunk_size"])
    
    # Select the chunk
    start_idx = chunk_index * chunk_size
    end_idx = start_idx + chunk_size
    chunk_calls = all_calls[start_idx:end_idx]
    
    # Filter to only this chunk
    config["variant-calls"] = {
        key: callset
        for key, callset in config["variant-calls"].items()
        if key in chunk_calls
    }


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
