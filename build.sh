# Default values
projectName="myapp"
outputName="output"

# Parse command line options
while getopts p:o: flag
do
    case "${flag}" in
        p) projectName=${OPTARG};;
        o) outputName=${OPTARG};;
    esac
done

# for arg in "$@"
# do
#     case $arg in
#         --project=*)
#         projectName="${arg#*=}"
#         shift
#         ;;
#         --output=*)
#         outputName="${arg#*=}"
#         shift
#         ;;
#     esac
# done

# Navigate to the project directory
cd "/mnt/c/iDev/TheIceJI/Celestia-Main/apps/${projectName}/.next/standalone" || exit

# Compress the project files into a 7z archive
7z a -t7z "${outputName}.7z" *

echo "Compression complete: ${outputName}.7z"
