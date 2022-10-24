export CHOUFFE='192.168.1.30'
export CHOUFFE_VOLUME_URI="//$CHOUFFE"
export MOUNT_CHOUFFE='/media/chouffe'

function mount_chouffe () {	
	for dir in downloads music video homes photo
	do
		sudo mount -t cifs -o iocharset=utf8,file_mode=0777,dir_mode=0777,credentials=/root/.smbcredentials $CHOUFFE_VOLUME_URI/$dir $MOUNT_CHOUFFE/$dir
	done
}

function umount_chouffe () {
	for dir in downloads music video homes photo
	do
		sudo umount -f "$MOUNT_CHOUFFE/$dir"
	done
}
