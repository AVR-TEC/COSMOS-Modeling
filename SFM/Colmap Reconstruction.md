# Running COLMAP
(https://colmap.github.io/cli.html#cli)



Automatic Reconstruction by command-line interface
---------------------------------------------------------------------------------
Assuming the Project folder contain a folder "images" with all the images 
   similar to the following structure:
```
 /path/to/project/...
 +── images
 │   +── image1.jpg
 │   +── image2.jpg
 │   +── ...
 │   +── imageN.jpg
```
NOTE: To learn how to use the graphical interface the following video is available https://www.youtube.com/watch?v=P-EC0DzeVEU


* Running Automatic Reconstruction
```
PROJECT_PATH=/path/to/project

./colmap/build/src/exe/automatic_reconstructor \
    --workspace_path $PROJECT_PATH \
    --image_path $PROJECT_PATH/images
```


Manual Reconstruction by command-line interface
---------------------------------------------------------------------------------
NOTE: Each functionality executable is inside the ./colmap/build/src/exe/* folder


The project folder must contain a folder "images" with all the images
```
PROJECT_PATH=/path/to/project
```

* Feature Extraction
```
./colmap/build/src/exe/feature_extractor \
   --database_path $PROJECT_PATH/database.db \
   --image_path $PROJECT_PATH/images
```

* Feature Matching
```
./colmap/build/src/exe/exhaustive_matcher \
   --database_path $PROJECT_PATH/database.db
```

* Getting a Sparse Cloud
```
mkdir $PROJECT_PATH/sparse

./colmap/build/src/exe/mapper \
    --database_path $PROJECT_PATH/database.db \
    --image_path $PROJECT_PATH/images \
    --export_path $PROJECT_PATH/sparse
```

* Getting a Dense Cloud
```
mkdir $PROJECT_PATH/dense

./colmap/build/src/exe/image_undistorter \
    --image_path $PROJECT_PATH/images \
    --input_path $PROJECT_PATH/sparse/0 \
    --output_path $PROJECT_PATH/dense \
    --output_type COLMAP \
    --max_image_size 2000
```

* Generate the Mesh
```
./colmap/build/exe/dense_stereo \
    --workspace_path $PROJECT_PATH/dense \
    --workspace_format COLMAP \
    --DenseStereo.geom_consistency true

./colmap/build/exe/dense_fuser \
    --workspace_path $PROJECT_PATH/dense \
    --workspace_format COLMAP \
    --input_type geometric \
    --output_path $PROJECT_PATH/dense/fused.ply

./colmap/build/src/exe/dense_mesher \
    --input_path $PROJECT_PATH/dense/fused.ply \
    --output_path $PROJECT_PATH/dense/meshed.ply
```
