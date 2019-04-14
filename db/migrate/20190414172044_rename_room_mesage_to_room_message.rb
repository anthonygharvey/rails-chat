class RenameRoomMesageToRoomMessage < ActiveRecord::Migration[5.2]
	def change
		rename_table :room_mesages, :room_messages
  end
end
