# Abstract 

By default Argo has ability to work with blobs on Google Storage 
Due bad practices, people tend to store many files in folders instead archives as blobs.
GS API doesn't support recursive oparation thus `gsutil` does iplemented it.

# Example 

This example will copy 'folder' on Google Storage to local persistent disk to process and store result back to Google storage.  

# Prerequisites

WARNING: It untested solution

## Add GCP service account 

To be able copy data from/to GS Bucket you need create secret with service account to do this: 

    $ kubectl create secret generic gsutil-secret --from-file=./acccess.json

    $ kubectl describe secret gsutil-secret
      Name:         gsutil-secret
      Namespace:    default
      Labels:       <none>
      Annotations:  <none>
      
      Type:  Opaque
      
      Data
      ====
      access.json:  2329 bytes 

## Modify clusterrolebinding for Argo

To run argo workflow with spark submit user binding must be modified 

    $ kubectl create clusterrolebinding default-argo-role --clusterrole=edit --serviceaccount=user:default --namespace=workspace-name

# Run Argo workflow

    $ argo submit copy-data-using-gsutil.yaml

# TO-DO

- [ ] Test it.  
