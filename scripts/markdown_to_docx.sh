#! /bin/bash
# fileName : markdown_to_docx.sh
# author   : lingjie
# date     : 2018-08-29

if [ $# != 1 ] || [ ${1##*.} != "md" ] ; then
    echo "使用方法： markdown_to_docx.sh <filename>.md"
    exit
fi

pwd=$(dirname $0)
fileName=${1##*/}
srcFile="${pwd}/../translation/${fileName:0:-3}.md"
objFile="${pwd}/../docx/${fileName:0:-3}.docx"
if [ -f $srcFile ] ; then
    if [ -f $objFile ] ; then
        echo "目标文件已经存在"
    else
        pandoc -f markdown+tex_math_dollars -t docx $srcFile -o $objFile --latex-engine=xelatex
    fi
else
   echo "源文件不存在"
fi
