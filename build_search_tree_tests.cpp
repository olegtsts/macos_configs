#include <iostream>
#include <cstdlib>
#include <vector>
#include <cstdio>
#include <algorithm>

const size_t RANDOM_BASE = 300;

struct node
{
	int key;
	int left_idx;
	int right_idx;
};

class RandomSearchTree {
private:
	std::vector <node *> nodes;
	node * root;
public:
	RandomSearchTree()
	: nodes()
	, root(NULL)
	{
		AddRandomNodes();
	}

//	bool HasLeftSubtree(const size_t index) const {
//		return nodes[index].left_idx != 0;
//	}
//
//	bool HasRightSubtree(const size_t index) const {
//		return nodex[index].right_idx != 0;
//	}

//	size_t GoLeft(const size_t index) const {
//		return nodes[index].left_idx;
//	}
//
//	size_t GoRight(const size_t index) const {
//		return nodes[index].right_idx;
//	}

//	void AssignLeftSon(const size_t parent, const size_t left_son) {
//		nodes[parent].left_idx = left_son;
//	}
//
//	void AssignRightSon(const size_t parent, const size_t right_son) {
//		nodes[parent].right_idx = right_son;
//	}

	bool HasLeftSubtree(node * current_node) const {
		return current_node->left_idx != 0;
	}

	bool HasRightSubtree(node * current_node) const {
		return current_node->right_idx != 0;
	}

	node * GoLeft(node * current_node) const {
		if (HasLeftSubtree(current_node)) {
			return nodes[current_node->left_idx];
		} else {
			return NULL;
		}
	}

	node * GoRight(node * current_node) const {
		if (HasRightSubtree(current_node)) {
			return nodes[current_node->right_idx];
		} else {
			return NULL;
		}
	}

	void AddRandomNode() {
		node * parent_node = NULL;
		node * current_node = root;

		node * new_node = new node();
		new_node->key = rand() % RANDOM_BASE;
		new_node->left_idx = 0;
		new_node->right_idx = 0;

		size_t new_index = nodes.size();
		bool is_left_son = false;

		nodes.push_back(new_node);

		while (current_node) {
			parent_node = current_node;
			if (new_node->key < current_node->key) {
				current_node = GoLeft(current_node);
				is_left_son = true;
			} else {
				current_node = GoRight(current_node);
				is_left_son = false;
			}
		}

		if (parent_node && is_left_son) {
			parent_node->left_idx = new_index;
		} else if (parent_node && !is_left_son) {
			parent_node->right_idx = new_index;
		} else if (!parent_node) {
			root = nodes[new_index];
		}
	}

	void AddRandomNodes () {
		size_t nodes_count = rand() % RANDOM_BASE + 1;
		for (size_t index = 0; index < nodes_count; ++index) {
			AddRandomNode();
		}
	}

	void PrintTree() const {
		PrintTreeRecursive(root, 0);
	}

	void PrintSpacing(const size_t spacing) const {
		for (size_t index = 0; index < spacing; ++index) {
			std::cout << " ";
		}
	}

	void PrintTreeRecursive(node * current_node, const size_t spacing) const {
		if (current_node) {
			PrintSpacing(spacing);
			std::cout << current_node->key << "\n";

			PrintSpacing(spacing);
			std::cout << "L:\n";
			PrintTreeRecursive(GoLeft(current_node), spacing + 2);

			PrintSpacing(spacing);
			std::cout << "R:\n";
			PrintTreeRecursive(GoRight(current_node), spacing + 2);
		}
	}

	void WriteInt(const int number, FILE * fh) const {
		char * buffer = (char *)&number;
		for (size_t index = 0; index < 4; ++index) {
			fprintf(fh, "%c", *(buffer + index));
		}
	}

	void WriteToBinary(const char * filename) const {
		FILE * fh;
		fh = fopen(filename, "w");

		for (size_t index = 0; index < nodes.size(); ++index) {
			node * current_node = nodes[index];
			WriteInt(current_node->key, fh);
			WriteInt(current_node->left_idx, fh);
			WriteInt(current_node->right_idx, fh);
		}

		fclose(fh);
	}

	void WriteAnswerAsText(const char * filename) const {
		FILE * fh;
		fh = fopen(filename, "w");

		std::vector<int> keys;
		for (size_t index = 0; index < nodes.size(); ++index) {
			keys.push_back(nodes[index]->key);
		}
		std::sort(keys.begin(), keys.end(), std::greater<int>());

		for (size_t index = 0; index < keys.size(); ++index) {
			fprintf(fh, "%d\n", keys[index]);
		}

		fclose(fh);
	}

	~RandomSearchTree() {
		for (size_t index = 0; index < nodes.size(); ++index) {
			delete nodes[index];
		}
	}
};

void DoOneTest() {
	RandomSearchTree random_search_tree;

	system("rm -rf input.txt corrent_answer.txt output.txt");

//	random_search_tree.PrintTree();
	random_search_tree.WriteToBinary("input.txt");
	random_search_tree.WriteAnswerAsText("corrent_answer.txt");
//	system("echo 'Expected Result:' && cat corrent_answer.txt");
	int ret = system("./1.out input.txt > output.txt && diff corrent_answer.txt output.txt");
//	system("echo 'Got Result:' && cat output.txt");
	if (WEXITSTATUS(ret) == 0) {
		std::cout << "OK\n";
	} else {
		std::cout << "NOT OK\n";
		throw 1;
	}
}

int main () {
	for (size_t index = 0; index < 1000; ++index) {
		DoOneTest();
	}

	return 0;
}
