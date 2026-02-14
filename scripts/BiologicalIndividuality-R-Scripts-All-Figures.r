# BiologicalIndividuality-Taxonomy — Figure generation scripts
# (Assumes required data objects like `proj` are already in your workspace.)

library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

# ----------------------------
# Figure 1D: 4D PCA (tiers as clusters)
# Requires: data frame `proj` with columns x, y, g (tier/cluster label)
# ----------------------------
p1d <- ggplot(proj, aes(x, y, color = g)) +
  geom_point(size = 4) +
  scale_color_manual(values = c(I = "green", II = "gold", "III/IV" = "darkgreen")) +
  labs(title = "Figure 1D: 4D PCA\n(Tiers as clusters)") +
  theme_minimal(base_size = 14)

ggsave("Fig1D_4DPCA.pdf", plot = p1d, width = 10, height = 8, dpi = 300, bg = "white")


# ----------------------------
# Figure 1A: 4 axes parallel plot
# ----------------------------
p1a_data <- data.frame(
  Axis = rep(c("Spatial", "Functional", "Bottleneck", "Fitness"), 3),
  Score = c(1, 1, 1, 1,
            1, 0.1, 0, 0,
            1, 0.8, 0.3, 0.2),
  Example = c(rep("Tier IV", 4), rep("Tier I", 4), rep("Tier II", 4))
)

p1a <- ggplot(p1a_data, aes(Axis, Score, group = Example, color = Example)) +
  geom_line(linewidth = 3) +
  geom_point(size = 5) +
  scale_color_manual(values = c("Tier IV" = "darkgreen", "Tier I" = "lightgreen", "Tier II" = "orange")) +
  labs(title = "Figure 1A: 4 Axes Parallel") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("Fig1A_Axes.pdf", plot = p1a, width = 10, height = 6, dpi = 300, bg = "white")


# ----------------------------
# Figure 2C: Regime shifts (illustrative)
# ----------------------------
p2c_data <- data.frame(
  Mya = c(3500, 2000, 1000, 470),
  y1  = c(0.5, 1, 1.5, 2),
  y2  = c(1, 3, 4, 4)
)

p2c <- ggplot(p2c_data, aes(Mya, y2)) +
  geom_segment(aes(xend = 0, yend = y1),
               arrow = arrow(),
               linewidth = 4,
               color = "navy") +
  geom_point(size = 8, color = "navy", stroke = 3) +
  scale_x_reverse() +
  labs(title = "Figure 2C: Regime Shifts", x = "Mya", y = "Tier") +
  theme_minimal(base_size = 14)

ggsave("Fig2C_Regimes.pdf", plot = p2c, width = 10, height = 6, dpi = 300, bg = "white")


# ----------------------------
# Figure 4C: Fitness decoupling proxy (conflict % by tier; illustrative)
# ----------------------------
set.seed(42)
t4c_data <- data.frame(
  Tier = rep(c("Tier II", "Tier III", "Tier IV"), each = 25),
  Conflict = c(rnorm(25, 0.7, 0.15),
               rnorm(25, 0.35, 0.12),
               rnorm(25, 0.08, 0.05))
)

p4c <- ggplot(t4c_data, aes(Tier, Conflict, fill = Tier)) +
  geom_boxplot(linewidth = 1.5, color = "black") +
  scale_fill_manual(values = c("Tier II" = "orange", "Tier III" = "gold", "Tier IV" = "darkgreen")) +
  labs(title = "Figure 4C", y = "Conflict %") +
  theme_minimal(base_size = 14)

ggsave("Fig4C_Decoupling.pdf", plot = p4c, width = 8, height = 6, dpi = 300, bg = "white")


# ----------------------------
# Figure 4D: Germline timing vs cancer (illustrative)
# ----------------------------
g4d_data <- data.frame(
  Timing = c(0, 0.3, 0.4, 0.18),
  Cancer = c(0.12, 0.15, 0.08, 0.19),
  Taxon  = c("Sponges", "Cnidarians", "Insects", "Mammals")
)

p4d <- ggplot(g4d_data, aes(Timing, Cancer)) +
  geom_point(size = 8, color = "darkred", stroke = 4) +
  geom_smooth(method = "lm", se = TRUE, linewidth = 2) +
  scale_x_continuous(labels = percent_format()) +
  scale_y_continuous(labels = percent_format()) +
  labs(title = "Figure 4D", x = "Timing (% dev)", y = "Cancer %") +
  theme_minimal(base_size = 14)

ggsave("Fig4D_IIIb.pdf", plot = p4d, width = 9, height = 6, dpi = 300, bg = "white")


# ----------------------------
# Figure 3E: Parallel symbiosis integration track (bar chart)
# ----------------------------
symb <- data.frame(
  Dim = factor(c("Transmission", "Fidelity", "Metabolic", "Diversity")),
  Aphid = c(1, 0.95, 1, 0.8),
  Coral = c(0.4, 0.7, 0.85, 0.6)
)

sym_long <- pivot_longer(symb, -Dim, names_to = "Assemblage", values_to = "Score")

p3e <- ggplot(sym_long, aes(Dim, Score, fill = Assemblage)) +
  geom_col(position = "dodge", color = "black", linewidth = 1.2) +
  coord_flip() +
  scale_fill_manual(values = c(Aphid = "darkblue", Coral = "lightblue")) +
  scale_y_continuous(labels = percent_format()) +
  labs(
    title = "Figure 3E: Parallel Symbiosis Track",
    subtitle = "High scores = functional Tier IV equivalence"
  ) +
  theme_minimal(base_size = 14)

ggsave("Fig3E_Symbiosis.pdf", plot = p3e, width = 9, height = 6, dpi = 300, bg = "white")
