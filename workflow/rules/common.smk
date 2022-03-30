from snakemake.remote.zenodo import RemoteProvider as ZenodoRemoteProvider

def get_zenodo_input(wildcards):
    callset = config["variant-calls"][wildcards.callset]
    return ZenodoRemoteProvider(deposition=callset["zenodo"], access_token=os.environ["ZENODO_TOKEN"]).remote(wildcards.path)