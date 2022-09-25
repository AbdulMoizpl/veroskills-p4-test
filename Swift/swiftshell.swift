import SwiftShell

do {
	// If there is an argument, try opening it as a file. Otherwise use standard input.
	let input = try main.arguments.first.map {try open($0)} ?? main.stdin

	input.lines().enumerated().forEach { (linenr,line) in
		print(linenr+1, ":", line)
	}

	// Add a newline at the end.
	print("")
} catch {
	exit(error)
}