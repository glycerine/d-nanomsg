import nanomsg;
import core.stdc.stdio;
import core.stdc.string;
import std.string;

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
  char msg[256];
  char* pRecvd;

  char* SOCKET_ADDRESS = cast(char*)"tcp://127.0.0.1:5555";


  // client, running on windows

  auto sc = nn_socket (AF_SP, NN_PAIR);
  assert (sc >= 0);

  // connect
  auto rc = nn_connect (sc, SOCKET_ADDRESS);
  assert (rc > 0);

  // send
  memcpy(buf, "WHY\0".ptr, 4);
  rc = nn_send (sc, buf, 3, 0);
  printf("client: I sent '%s'\n", buf);
  assert (rc >= 0);
  assert (rc == 3); // nn_assert

  // receive
  rc = nn_recv (sc, &pRecvd, NN_MSG, 0);
  assert (rc >= 0);
  assert (rc == 3); // nn_assert

  sprintf(msg, "client: I received: '%s'\n\0", buf);
  printf(msg);

  // free
  rc = nn_freemsg(pRecvd);
  assert (rc == 0);

  // close
  rc = nn_close (sc);
  assert (rc == 0);

  return 0;
}
