# ============================================================
# 复现论文 Figure 3b-d: 絮凝指数柱状图
# 数据来源：mmc6.csv (手工提取的正确数据)
# ============================================================

library(ggplot2)
library(dplyr)

# 正确数据（直接从 mmc6.csv 提取）
raw_data <- data.frame(
  mineral = c(
    rep("GOE", 12),
    rep("MnO2", 12),
    rep("MMT", 12)
  ),
  treatment = c(
    rep(c("H2O", "Glomalin", "HA", "BSA"), each = 3),
    rep(c("H2O", "Glomalin", "HA", "BSA"), each = 3),
    rep(c("H2O", "Glomalin", "HA", "BSA"), each = 3)
  ),
  At_A0 = c(
    # GOE
    0.8064, 0.7931, 0.7859,   # H2O
    0.0510, 0.0566, 0.0511,   # Glomalin
    0.9540, 0.9962, 0.9846,   # HA
    1.2060, 1.1998, 1.2181,   # BSA
    # MnO2
    0.6040, 0.6085, 0.6100,   # H2O
    0.0808, 0.0779, 0.0323,   # Glomalin
    0.8201, 1.0503, 0.9367,   # HA
    0.6415, 0.4861, 0.4746,   # BSA
    # MMT
    0.8330, 0.8653, 0.8262,   # H2O
    0.1918, 0.0703, 0.2160,   # Glomalin
    0.7889, 0.7777, 0.8891,   # HA
    0.9311, 0.9502, 0.9370    # BSA
  )
)

# 计算均值和标准差
plot_data <- raw_data %>%
  group_by(mineral, treatment) %>%
  summarise(
    mean_A0 = mean(At_A0),
    sd_A0 = sd(At_A0),
    .groups = "drop"
  )

# 设置处理顺序（与论文一致）
plot_data$treatment <- factor(plot_data$treatment,
                               levels = c("H2O", "BSA", "HA", "Glomalin"))

# 矿物标签
mineral_labels <- c(
  "GOE" = "GOE (Goethite)",
  "MnO2" = "MnO₂ (Pyrolusite)",
  "MMT" = "MMT (Montmorillonite)"
)

# 打印数据核对
print(plot_data)

# 绘图
p <- ggplot(plot_data, aes(x = treatment, y = mean_A0, fill = treatment)) +
  geom_col(width = 0.7, alpha = 0.8) +
  geom_errorbar(aes(ymin = mean_A0 - sd_A0, ymax = mean_A0 + sd_A0),
                width = 0.2, linewidth = 0.5) +
  scale_fill_manual(values = c("H2O" = "gray70",
                                "BSA" = "lightblue",
                                "HA" = "lightgreen",
                                "Glomalin" = "salmon")) +
  facet_wrap(~mineral, ncol = 3,
             labeller = labeller(mineral = mineral_labels)) +
  labs(
    title = "Figure 3b-d: Flocculation of minerals with different organic matter",
    x = "",
    y = expression(A[t] / A[0])
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    plot.title = element_text(hjust = 0.5, face = "bold"),
    strip.text = element_text(face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  ylim(0, 1.4)

print(p)
ggsave("figure3_corrected.png", p, width = 10, height = 5, dpi = 300)

# 输出数据核对
cat("\n=== GOE 数据 ===\n")
print(filter(plot_data, mineral == "GOE"))
cat("\n=== MnO2 数据 ===\n")
print(filter(plot_data, mineral == "MnO2"))
cat("\n=== MMT 数据 ===\n")
print(filter(plot_data, mineral == "MMT"))