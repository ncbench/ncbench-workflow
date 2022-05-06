from snakemake.remote.zenodo import RemoteProvider as ZenodoRemoteProvider


# add path to callsets
for key, callset in config["variant-calls"].items():
    if "path" not in callset and "zenodo" in callset:
        filename = callset["zenodo"]["filename"]
        callset["path"] = f"resources/zenodo/variant-calls/{key}/{filename}"


def get_zenodo_input(wildcards):
    entry = config[wildcards.section][wildcards.entry]["zenodo"]
    kwargs = dict()
    if "restricted-access-token-envvar" in entry:
        kwargs["restricted_access_token"] = os.environ[entry["restricted-access-token-envvar"]]
    return ZenodoRemoteProvider(deposition=entry["deposition"], access_token=os.environ["ZENODO_TOKEN"], **kwargs).remote(wildcards.path)