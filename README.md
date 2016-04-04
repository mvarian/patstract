# Patstract 
**Pattern-Based File Extraction Script**

This script will extract any files matching the pattern to and move them to the destination path, preserving relative file structure and permissions.

## Example
  
If we have Windows shortcut files ending in .lnk in the following locations:  

`/source-dir/foo.lnk`  
`/source-dir/directory/subdirectory/bar.lnk`  

Executing patstract with destination as /dest-dir and pattern *lnk will remove these two linked files from the source-dir, and place them in the destination directory as:  

`/dest-dir/foo.lnk`  
`/dest-dir/directory/subdirectory/bar.lnk`  


## License

See the LICENSE file.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
