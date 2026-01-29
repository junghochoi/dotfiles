return {
	"Saghen/blink.cmp",
	-- dependencies = { url = "sso://user/zshihang/blink-ciderlsp" },
  dependencies = {
    "blink-ciderlsp",
    dir = "~/dchoi/blink-ciderlsp",
    dev = true,

  },
	opts = {
		sources = {
			default = {
				"ciderlsp",
			},
			providers = {
				ciderlsp = {
					name = "ciderlsp",
					module = "blink-ciderlsp",
					score_offset = 200,
					async = true,
					opts = {
						show_model = true,
					},
				},
			},
		},
	},
}

