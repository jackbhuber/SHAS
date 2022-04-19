# CLEAN DATA BY CODING ANY RESPONSES > 5 AS NA
all <- scrub(all, max=5) #e.g., change anything great than 5 to NA
