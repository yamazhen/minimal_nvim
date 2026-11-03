vim.pack.add({ "https://github.com/mfussenegger/nvim-jdtls" })

local root = vim.fs.root(0, { "gradlew", "mvnw", ".git" }) or vim.fn.getcwd()
local jdks = vim.fs.dirname(vim.env.JAVA_HOME)
local cache = vim.fn.stdpath("cache") .. "/jdtls"

local settings = {
	java = {
		autobuild = { enabled = false },
		completion = { maxResults = 50 },
		import = { gradle = { jvmArguments = "-Xmx2g" } },
		configuration = {
			runtimes = {
				{ name = "JavaSE-17", path = jdks .. "/17.0.19-amzn" },
				{ name = "JavaSE-21", path = jdks .. "/21.0.11-amzn" },
				{ name = "JavaSE-25", path = jdks .. "/25.0.4-amzn" },
			}
		}
	}
}

require('jdtls').start_or_attach({
	cmd = {
		"jdtls",
		"--jvm-arg=-XX:+UseParallelGC",
		"--jvm-arg=-XX:GCTimeRatio=4",
		"--jvm-arg=-XX:AdaptiveSizePolicyWeight=90",
		"--jvm-arg=-Dsun.zip.disableMemoryMapping=true",
		"--jvm-arg=-Djdt.core.sharedIndexLocation=" .. cache .. "/index",
		"-data", cache .. "/" .. root:gsub("/", "_"),
	},
	root_dir = root,
	settings = settings,
	init_options = { settings = settings }
})
