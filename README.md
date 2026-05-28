一、项目基本信息

小组名称：土壤化学与环境研究小组

作业主题：复现论文《Soil aggregates stability is evidently enhanced by super-binding of the N-terminal disordered tail of glomalin to soil minerals》 Figure 2（a、b、c）和Figure 3b、3c、3d，完成数据分析全流程。

提交仓库：D2RS-2026spring—— https://github.com/D2RS-2026spring/

小组成员：汪梦鑫2025303110071，杜艳坤2025303110018，黄灿：2025303110084，文宇佳：2025303120102

核心任务：基于论文原文、配套数据与复现要求，完成数据读取、清洗、绘图、结果解读，保证可复现、可追溯。

论文全文链接：https://doi.org/10.1016/j.soilbio.2025.109908



二、项目背景与目标

1\. 项目背景

本项目为课程小组作业，基于提供的论文《Soil aggregates stability is evidently enhanced by super-binding of the N-terminal disordered tail of glomalin to soil minerals》、数据集 mmc6.csv，mmc5.csv(手工录入)以及复现说明文档，完成论文 Figure2、Figure3的精确复现工作。

2\. 项目目标

（1）	完成数据预处理 → 数据分析与可视化 → 研究报告完整流程。

（2）	1:1 复现论文Figure 2、Figure 3b、c、d 絮凝指数柱状图，与原文趋势、样式一致。

（3）	保证项目可复现，多设备运行结果一致。

数据及代码下载地址： https://github.com/Dear-meng/glomalin\_reproduce



三、环境与依赖

1\. 运行环境

语言：R（≥4.1）

系统：Windows /macOS/ Linux 均可

2\. 核心依赖包

ggplot2

dplyr

readr



四、数据预处理（数据源说明）

1\. 数据源

•	原始数据：mmc5.csv,mmc6.csv

•	包含矿物：GOE、MnO₂、MMT

•	处理组：H₂O、Glomalin、HA、BSA

•	指标：At/A0（絮凝指数，数值越低表示絮凝越强）

2\. 预处理步骤

1\.	读取原始 CSV 数据

2\.	按矿物与处理分组，计算均值与标准差

3\.	统一因子顺序，保证绘图与论文一致

4\.	输出清洗后数据用于绘图



五、数据分析与可视化（Figure2a、b、c, Figure 3b、c、d 复现）

1\. 复现内容

复现论文 Figure2a、b、c：球囊霉素对酸性土壤中土壤团粒形成与稳定性的影响和Figure 3b、3c、3d：三种矿物在不同有机质处理下的絮凝指数柱状图。

2\. 复现结果

已生成图片：outputs/figures/figure3\_corrected.png

与论文趋势完全一致：Glomalin 组 At/A0 最低，絮凝最强

分组、颜色、误差棒、分面、标签均与原文匹配

3\. 核心结论

球囊霉素（Glomalin）增加了土壤团聚体稳定性，并且对三种矿物均表现出极强絮凝作用，显著优于 HA、BSA 与空白对照组。



六、研究报告与结果解读

1\.	复现一致性：图表样式、数据趋势、分组结构与原文完全一致。

2\.	科学意义：证明 Glomalin 能强力结合矿物，促进土壤团聚，是土壤团聚体稳定的关键物质。

3\.	方法可靠性：数据来源明确、代码可复现、统计方法规范。



七、可复现性说明

1\.	克隆/下载项目文件

2\.	安装 R 与依赖包

3\.	直接运行 code/test\_fig2.R, code/test\_fig3.R

4\.	自动生成图片并输出统计结果

5\.	已在多台设备验证，结果完全一致



八、协作开发说明

汪梦鑫：数据整理、代码编译运行、复现Figure 2的前三个。

杜艳坤：数据整理、代码编译运行、复现Figure 3b、3c、3d。

黄灿：代码复现，写结果报告。

文宇佳：代码复现，写READ.docx文件。



