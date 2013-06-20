#!/bin/sh

if [ x$1 == x ]; then
  echo "no core, socket, web running.."
fi

sudo pwd

echo "wait sec.. memcached"
sleep 1

# run memcached
# <- /usr/local/memcached-1.4.13/memcached -d
memcached -d &

echo "wait sec.. run mysql"
sleep 1

# run mysql
mysqld &

echo "wait a sec.. lock server"
sleep 1

# run cross doamin server
sudo java -classpath '/Users/user/Documents/workspace-sts-2.8.1.RELEASE/test_net_command/target/classes' jp.test.net.command.util.CrossdomainServer &

echo "wait sec.. run wap server"
sleep 1

if [ x$1 == x ]; then
  echo "no wap running.."
  exit 0
fi

# each server
sudo java -classpath '/Users/user/Documents/workspace-sts-2.8.1.RELEASE/test/target/classes' jp.test.ChatServerLauncher &
echo $!
sleep 2
sudo java -classpath '/Users/user/Documents/workspace-sts-2.8.1.RELEASE/test/target/classes' jp.test.GameServerLauncher &
echo $!
sleep 2

exit 0
