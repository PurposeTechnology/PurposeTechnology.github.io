#!/bin/bash



function remove_header_comments(){
	# Removal of Header comments and comments between them.
	lead='^# START (From reconfiguration project)$'
	tail='^# END (From reconfiguration project)$'
	sed -e "/$lead/,/$tail/{ /$lead/{p; r insert_file
		}; /$tail/p; d }"  "$HOME/.bashrc" >> "$HOME/.bashrc-temp"
	rm "$HOME/.bashrc";
	mv "$HOME/.bashrc-temp" "$HOME/.bashrc"

	sed '/^# START (From reconfiguration project)$/d' "$HOME/.bashrc" >> ".bashrc-removed-first-header-comment"
	sed '/^# END (From reconfiguration project)$/d' ".bashrc-removed-first-header-comment" >> ".bashrc-removed-second-header-comment"
	rm "$HOME/.bashrc"
	rm ".bashrc-removed-first-header-comment";
	mv ".bashrc-removed-second-header-comment" "$HOME/.bashrc"

}


remove_header_comments;


mkdir "$HOME/.bashrc.d"
chmod 700 "$HOME/.bashrc.d"

mkdir "$HOME/.bashrc.d"
cat << 'EOF' >> "$HOME/.bashrc"

# START (From reconfiguration project)
for file in $HOME/.bashrc.d/*.bashrc;
do
source "$file"
done
# END (From reconfiguration project)
EOF


rm "$HOME/.bashrc.d/reconfiguration.bashrc";
cat << 'EOF' >> "$HOME/.bashrc.d/reconfiguration.bashrc"
export PATH="$HOME/bin:$PATH"

EOF


         



# Adding custom commands

mkdir "$HOME/bin"
mkdir "$HOME/bin/reconfiguration"


cat << 'EOF' > "$HOME/bin/create"
echo "create command is ready"

EOF

chmod +x "$HOME/bin/create";
