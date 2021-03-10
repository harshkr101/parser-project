# parser-project

# C++ nested for-loop parser

## Prerequisite:
  -[Flex](https://github.com/westes/flex)
  -[Bison](https://www.gnu.org/software/bison/)
 
## Compilation

  1. **flex for_loop.l**
  2. **bison -ydv for_loop.y**
  3. **gcc lex.yy.c y.tab.c -o parser**
  4. **./parser sample.cpp**

### Contributors

  -[Lav Saini](https://github.com/13lav)
  -[Sandeep Singh]()
