import sys

source = sys.argv[1]
dest = sys.argv[2]

f = open(source)
source_script = f.read()
f.close()

result_script = ""
for line in source_script.split("\n"):
    if len(line.split("WINDOW_Talk(")) != 1:
        inside_quote = False
        skip_next_tilde = False
        new_line = ""
        for chara in line.replace("WINDOW_Talk", "WINDOW:Talk", 1):
            if chara == "\"" and (not skip_next_tilde):
                inside_quote = not inside_quote
            skip_next_tilde = False
            if chara == " " and inside_quote:
                chara = "쐃"
            new_line += chara
            if chara == "\\":
                skip_next_tilde = True
        result_script += new_line+"\n"
    else:
        result_script += line+"\n"

f = open(dest, "w")
f.write(result_script)
f.close()
