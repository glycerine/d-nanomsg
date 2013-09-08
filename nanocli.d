import nanomsg;
import core.stdc.stdio;
import core.stdc.string;
import std.string;
import std.stdio;

// ==================================
// ==================================
// nanocli.d 
// ==================================
// ==================================



int main ()
{
  int sb;
  int i;
  char buf [4];
  int opt;
  size_t sz;
  char* pRecvd;

  immutable char* SOCKET_ADDRESS = "tcp://127.0.0.1:5555".ptr;


  // client, running on windows

  auto sc = nn_socket (AF_SP, NN_PAIR);
  assert (sc >= 0);
  writefln("nn_socket returned: %d", sc);

  // connect
  auto rc = nn_connect (sc, cast(char*)SOCKET_ADDRESS);
  assert (rc > 0);

  // send
  memcpy(buf, "WHY\0".ptr, 4);
  rc = nn_send (sc, buf, 3, 0);
  writefln("client: I sent '%s'\n", buf);
  assert (rc >= 0);
  assert (rc == 3); // nn_assert

  // receive
  rc = nn_recv (sc, &pRecvd, NN_MSG, 0);
  assert (rc >= 0);
  assert (rc == 3); // nn_assert

  writefln("client: I received a %d byte msg: '%s'", rc, pRecvd);

  // free
  rc = nn_freemsg(pRecvd);
  assert (rc == 0);

  // close
  rc = nn_close (sc);
  assert (rc == 0);

  return 0;
}
