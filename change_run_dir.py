import json
import sys

# 你想要替換成的路徑
NEW_DIR = "/home/circyuan/my_project/mesa/mesa/src"

# compile_commands.json 的路徑
COMPILE_COMMANDS = "./mesa/compile_commands.json"

def main():
    with open(COMPILE_COMMANDS, "r") as f:
        data = json.load(f)

    # 修改每一筆 entry 的 directory
    for entry in data:
        entry["directory"] = NEW_DIR

    # 覆寫回去（保留 pretty format）
    with open(COMPILE_COMMANDS, "w") as f:
        json.dump(data, f, indent=2)

    print(f"Updated all 'directory' entries to: {NEW_DIR}")

if __name__ == "__main__":
    main()

