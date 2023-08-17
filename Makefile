# ================================================== #
#                    Makefile
#
#  Designer: Fernando WELZEL
#  Description:
#    - rtl_sim: Make and executes all testbenches
# ================================================== #

# ================= CONFIGURATION ================== #
include config.mk

# ================== TARGETS ======================= #
rtl_sim: $(VSIM_WORK_DIR)

# ================== RTL_SIM ======================= #
$(VSIM_WORK_DIR): $(SRC_DIR)
 	mkdir $(VSIM_WORK_DIR)