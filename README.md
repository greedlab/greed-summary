# Greed::Summary

generate `SUMMARY.md` for Github or Gitbook

## Installation

```sh
$ gem install greed-summary
```

## Usage

```
greed-summary [OPTION]

-t, --title [string]:
   title ,default 'SUMMARY'

-d, --directory [directory path]:
   target directory path ,default './'

-o, --output [file path]:
   output file path ,default './SUMMARY.md'

-i, --ignore [array]:
   ignore string array ,default '['resource', 'Resource']'

-s, --suffix [array]:
   suffix string array ,default '['.md', '.markdown']'

-S, --style [string]:
   output style ,could be 'github' or 'gitbook', default 'github'

-a, --autotitle:
   auto set file title from file content, set directory title from readme.md file content

-e, --encode:
   url encode

-h, --help:
   show help

-v, --version:
   show version
```

## Example

use

```sh
greed-summary -t "Bell's Blog" -i '[scripts,resource,Resource,Publish,_book,docs,node_modules,assets]' -d ${BLOG_DIRECTORY}/ -o ${BLOG_DIRECTORY}/README.md -S github -a
```

to generate [README.md](https://github.com/greedbell/blog/blob/master/README.md) from [Blog](https://github.com/greedbell/blog)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
