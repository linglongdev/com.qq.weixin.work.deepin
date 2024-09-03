#!/bin/bash  
  
# 使用find命令递归地查找所有的软链接  
find . -type l | while read link; do  
    # 读取软链接的目标  
    target=$(readlink "$link")  
      
    # 检查目标是否以/opt/deepin-wine8-stable开头  
    if [[ "$target" == /opt/deepin-wine8-stable/* ]]; then  
        # 替换路径中的/usr/deepin-wine8-stable为/runtime/deepin-wine8-stable  
        new_target=${target//\/opt\/deepin-wine8-stable/\/runtime\/deepin-wine8-stable}  
          
        # 更新软链接的目标  
        ln -snf "$new_target" "$link"  
          
        # 输出更新信息  
        echo "Updated link $link to point to $new_target"  
    fi  
done