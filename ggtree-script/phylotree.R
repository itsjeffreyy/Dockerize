library(ggtree)
library(ggplot2)

parameters <- commandArgs(TRUE)
treefile <- parameters[1]
metafile <- parameters[2]

tree <- read.tree(treefile) 
group_file <- read.table(metafile,header = T,row.names = 1,sep = "\t")

groupInfo <- split(row.names(group_file), group_file$group)
tree <- groupOTU(tree, groupInfo)
  
ggtree(tree, layout="fan", ladderize = FALSE, branch.length = "none",aes(color=group)) + 
  geom_tiplab2(size=3) + theme(legend.position = "right")+
  scale_color_manual(values = c('black','red'))+ 
  theme(legend.position="none")
ggsave("tree.png",width = 40,height = 40)
  