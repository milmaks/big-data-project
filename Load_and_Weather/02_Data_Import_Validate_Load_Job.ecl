IMPORT STD;
IMPORT Constants;
IMPORT Load;

load_raw_ds := DATASET(Constants.load_raw_file_path, Load.load_raw_layout, CSV(HEADING(1)));

OUTPUT(STD.File.GetLogicalFileAttribute(Constants.load_raw_file_path,'size'),NAMED('Load_File_Size'));
OUTPUT(STD.File.GetLogicalFileAttribute(Constants.load_raw_file_path,'clusterName'),NAMED('Load_Cluster_Name'));
OUTPUT(STD.File.GetLogicalFileAttribute(Constants.load_raw_file_path,'directory'),NAMED('Load_Directory'));
OUTPUT(STD.File.GetLogicalFileAttribute(Constants.load_raw_file_path,'numparts'),NAMED('Load_Data_Parts'));

OUTPUT(load_raw_ds,,NAMED('Raw_Load_Data'));