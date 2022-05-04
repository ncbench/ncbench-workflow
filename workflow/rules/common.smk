from snakemake.remote.zenodo import RemoteProvider as ZenodoRemoteProvider

def get_zenodo_input(wildcards):
    callset = config["variant-calls"][wildcards.callset]
    kwargs = dict()
    if "restricted-access-token-envvar" in callset:
        kwargs["restricted_access_token"] = os.environ[callset["restricted-access-token-envvar"]]
    return ZenodoRemoteProvider(deposition=callset["zenodo"], access_token=os.environ["ZENODO_TOKEN"], **kwargs).remote(wildcards.path)
